/*
 * The CellRendererToggle is used in a TreeView to allow toggling true or false
 * on a particular row. This is commonly used to indicate the active or inactive
 * state of the row item.
*/

using Gtk;

public class Example : Window
{
    private Gtk.ListStore liststore;

    public Example()
    {
        this.title = "CellRendererToggle";
        this.destroy.connect(Gtk.main_quit);

        liststore = new Gtk.ListStore(2, typeof(string), typeof(bool));
        Gtk.TreeIter iter;

        liststore.append(out iter);
        liststore.set(iter, 0, "Chloe", 1, true, -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Jessica", 1, false, -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Margaret", 1, false, -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Tina", 1, true, -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Ashley", 1, false, -1);

        var treeview = new TreeView();
        treeview.set_model(liststore);
        this.add(treeview);

        var cellrenderertext = new CellRendererText();

        var treeviewcolumn = new TreeViewColumn();
        treeviewcolumn.set_title("Student");
        treeviewcolumn.pack_start(cellrenderertext, true);
        treeviewcolumn.add_attribute(cellrenderertext, "text", 0);
        treeview.append_column(treeviewcolumn);

        var cellrenderertext2 = new CellRendererToggle();
        cellrenderertext2.toggled.connect(on_cell_edited);

        var treeviewcolumn2 = new TreeViewColumn();
        treeviewcolumn2.set_title("Present");
        treeviewcolumn2.pack_start(cellrenderertext2, true);
        treeviewcolumn2.add_attribute(cellrenderertext2, "active", 1);
        treeview.append_column(treeviewcolumn2);
    }

    private void on_cell_edited(string treepath)
    {
        Gtk.TreeIter treeiter;
        Value val;

        liststore.get_iter_from_string (out treeiter, treepath);
        liststore.get_value(treeiter, 1, out val);

        if (val == true)
            liststore.set(treeiter, 1, false);
        else
            liststore.set(treeiter, 1, true);
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
