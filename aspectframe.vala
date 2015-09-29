/*
 * An AspectFrame provides an ornamental container for a group of widgets. It is
 * similar to a standard Frame, but obeys ratios to ensure it maintains a set
 * size.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.set_default_size(200, 200);
        this.set_border_width(5);
        this.title = "AspectFrame";
        this.destroy.connect(Gtk.main_quit);

        var frame = new Gtk.AspectFrame("AspectFrame Example", 0, 0, 1, false);
        this.add(frame);

        var label = new Gtk.Label("Label in AspectFrame");
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
