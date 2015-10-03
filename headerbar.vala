/*
 * The HeaderBar on some platforms replaces the titlebar typically drawn by the
 * Window Manager. It adds application functionality, the window title, and
 * buttons such as close and minimise in a simple place.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "HearBar";
        this.set_default_size(200, 200);
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        var headerbar = new HeaderBar();
        headerbar.set_title("HeaderBar Example");
        headerbar.set_subtitle("HeaderBar Subtitle");
        headerbar.set_show_close_button(true);
        grid.add(headerbar);

        var label1 = new Label("Pack Start");
        headerbar.pack_start(label1);
        var label2 = new Label("Pack End");
        headerbar.pack_end(label2);
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
