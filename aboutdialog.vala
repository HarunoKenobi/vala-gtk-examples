/*
 * The AboutDialog has the sole purpose of displaying information about the
 * application. This includes the name, version, authors, website, and a short
 * comment.
*/

using Gtk;
using Gdk;

public class Example : AboutDialog
{
    public Example()
    {
        var logo = new Gdk.Pixbuf.from_file_at_size("_resources/gtk.png", 64, 64);
        const string[] authors = {"Andrew Steele", "Bob Davies", "Chris Tomkins", "David Francis"};

        this.title = "AboutDialog";
        this.set_title("AboutDialog");
        this.set_name("Programmica");
        this.set_version("1.0");
        this.set_comments("Programming, system and network administration resources");
        this.set_website("https://programmica.com/");
        this.set_website_label("Programmica Website");
        this.set_authors(authors);
        this.set_logo(logo);
        this.response.connect(on_response);
        this.destroy.connect(Gtk.main_quit);
    }

    private void on_response(Dialog dialog, int response)
    {
        Gtk.main_quit();
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var dialog = new Example();
        dialog.show();

        Gtk.main();

        return 0;
    }
}
