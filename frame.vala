/*
 * A Frame provides an ornamental container for a group of widgets which
 * typically have a similar purpose. A title is used to identify the group.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.set_default_size(200, 200);
        this.set_border_width(5);
        this.title = "Frame";
        this.destroy.connect(Gtk.main_quit);

        var frame = new Gtk.Frame("Frame Example");
        this.add(frame);

        var label = new Gtk.Label("Label in Frame");
        frame.add(label);
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
