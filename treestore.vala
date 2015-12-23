/*
 * A TreeStore is used with view widgets using a model for data such as the
 * TreeView. It provides for items which can have children to be displayed in a
 * tree-like fashion.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "TreeStore";
        this.destroy.connect(Gtk.main_quit);

        var treestore = new Gtk.TreeStore(1, typeof(string));
        Gtk.TreeIter iter;
        Gtk.TreeIter child;

        treestore.append(out iter, null);
        treestore.set(iter, 0, "Maris Wilkinson", -1);
        treestore.append(out child, iter);
        treestore.set(child, 0, "maris.wilkinson@mymail.com", -1);

        treestore.append(out iter, null);
        treestore.set(iter, 0, "Tina Gregory", -1);
        treestore.append(out child, iter);
        treestore.set(child, 0, "tgregory@mailworld.com", -1);

        treestore.append(out iter, null);
        treestore.set(iter, 0, "Danielle Ball", -1);
        treestore.append(out child, iter);
        treestore.set(child, 0, "danielleball77@snailmail.net", -1);

        var treeview = new TreeView();
        treeview.set_model(treestore);
        this.add(treeview);

        var cellrenderertext = new CellRendererText();

        var treeviewcolumn = new TreeViewColumn();
        treeviewcolumn.set_title("Name");
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
