/*
 * The Paned widget provides two panels oriented vertically or horizontally.
 * Widgets can be added to the Paned container, with the separator between the
 * two panes being adjustable.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Paned";
        this.destroy.connect(Gtk.main_quit);

        var vpaned = new Paned(Gtk.Orientation.VERTICAL);
        this.add(vpaned);

        var label1 = new Label("Paned Area 1");
        vpaned.add1(label1);

        var hpaned = new Paned(Gtk.Orientation.HORIZONTAL);
        vpaned.add2(hpaned);

        var label2 = new Label("Paned Area 2");
        hpaned.add1(label2);
        var label3 = new Label("Paned Area 3");
        hpaned.add2(label3);
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.set_default_size(200, 200);
        window.show_all();

        Gtk.main();

        return 0;
    }
}
