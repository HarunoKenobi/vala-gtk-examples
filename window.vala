/*
 * The Window provides the base for most applications, on which other containers
 * and widgets are placed.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Window";
        this.set_default_size(200, 200);
        this.destroy.connect(Gtk.main_quit);
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
