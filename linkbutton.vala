/*
 * A LinkButton provides a method of opening websites which are defined in the
 * widget. Clicking on the button opens the default web browser for the site.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "LinkButton";
        this.destroy.connect(Gtk.main_quit);

        var linkbutton = new LinkButton("http://programmica.com");
        linkbutton.set_label("Programmica");
        this.add(linkbutton);
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
