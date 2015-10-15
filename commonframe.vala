/*
 * A CommonFrame is a combination of widgets and settings to provide a widget
 * commonly used in GTK+ applications. It is often used as its visual appearance
 * is cleaner.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.set_default_size(200, 200);
        this.set_border_width(5);
        this.title = "CommonFrame";
        this.destroy.connect(Gtk.main_quit);

        var title = new Label("<b>CommonFrame Example</b>");
        title.set_use_markup(true);

        var frame = new Frame(null);
        frame.set_shadow_type(Gtk.ShadowType.NONE);
        frame.set_label_widget(title);
        this.add(frame);

        var grid = new Grid();
        grid.set_vexpand(true);
        grid.set_hexpand(true);
        grid.set_property("margin-left", 12);
        grid.set_property("margin-top", 5);
        frame.add(grid);

        var label = new Label("Label in CommonFrame");
        grid.attach(label, 0, 0, 1, 1);
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
