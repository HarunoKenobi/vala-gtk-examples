/*
 * The CellRendererText is used within a TreeView or ComboBox, to provide the
 * rendering of text values onto the widget. Text is mostly displayed but can
 * also be edited in the widget.
*/

using Gtk;

public class Example : Window
{
    private Gtk.ListStore liststore;

    public Example()
    {
        this.title = "CellRendererText";
        this.destroy.connect(Gtk.main_quit);

        liststore = new Gtk.ListStore(2, typeof(string), typeof(string));
        Gtk.TreeIter iter;

        liststore.append(out iter);
        liststore.set(iter, 0, "Willow", 1, "Willows grow quickly and thrive in moist soil.", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Ash", 1, "Ash trees have large root systems and are late into leaf.", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Elm", 1, "The Elm thrives in sun or partial shade in deep soils.", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Oak", 1, "An Oak is dome-shaped with large wavy-edged leaves.", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Maple", 1, "Maple trees come in a range of sizes and colours.", -1);

        var treeview = new TreeView();
        treeview.set_model(liststore);
        this.add(treeview);

        var cellrenderertext = new CellRendererText();

        var treeviewcolumn = new TreeViewColumn();
        treeviewcolumn.set_title("Tree");
        treeview.append_column(treeviewcolumn);
        treeviewcolumn.pack_start(cellrenderertext, true);
        treeviewcolumn.add_attribute(cellrenderertext, "text", 0);

        var cellrenderertext2 = new CellRendererText();
        cellrenderertext2.set_property("editable", true);
        cellrenderertext2.edited.connect(on_cell_edited);

        var treeviewcolumn2 = new TreeViewColumn();
        treeviewcolumn2.set_title("Description");
        treeview.append_column(treeviewcolumn2);
        treeviewcolumn2.pack_start(cellrenderertext2, true);
        treeviewcolumn2.add_attribute(cellrenderertext2, "text", 1);
    }

    private void on_cell_edited(string treepath, string text)
    {
        Gtk.TreeIter treeiter;
        liststore.get_iter_from_string (out treeiter, treepath);
        liststore.set(treeiter, 1, text);
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.show_all();

        Gtk.main();

        return 0;
    }
}
