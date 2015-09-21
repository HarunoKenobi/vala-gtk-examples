/*
 * A picture can be displayed in an application by using the Image widget. It is
 * able to used for anything from small icons, to large photographic pictures.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Image";
        this.destroy.connect(Gtk.main_quit);

        var image = new Gtk.Image();
        image.set_from_file("gtk.png");
        this.add(image);
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
