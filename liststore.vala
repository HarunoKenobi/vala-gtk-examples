/*
 * A ListStore is used with view widgets using a model for data such as the
 * ComboBox and TreeView.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "ListStore";
        this.destroy.connect(Gtk.main_quit);

        var liststore = new Gtk.ListStore(1, typeof(string));
        Gtk.TreeIter iter;

        liststore.append(out iter);
        liststore.set(iter, 0, "Mauve", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Magenta", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Cyan", -1);

        var treeview = new TreeView();
        treeview.set_model(liststore);
        this.add(treeview);

        var cellrenderertext = new CellRendererText();

        var treeviewcolumn = new TreeViewColumn();
        treeviewcolumn.set_title("Colour");
        treeview.append_column(treeviewcolumn);
        treeviewcolumn.pack_start(cellrenderertext, true);
        treeviewcolumn.add_attribute(cellrenderertext, "text", 0);
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
