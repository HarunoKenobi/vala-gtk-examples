/*
 * The Popover provides a menu, much like the Menu widget. The major difference
 * however is the ability add a variety of sub-widgets as children.
*/

using Gtk;

public class Example : Window
{
    private Gtk.Popover popover;

    public Example()
    {
        this.title = "Popover";
        this.destroy.connect(Gtk.main_quit);

        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.add(box);

        var button = new Gtk.Button.with_label("Popover Launcher");
        button.clicked.connect(on_button_clicked);
        box.add(button);

        popover = new Gtk.Popover(button);
        popover.set_position(Gtk.PositionType.RIGHT);

        var box2 = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        popover.add(box2);

        var label = new Gtk.Label("A Label Widget");
        box2.add(label);
        var checkbutton = new Gtk.CheckButton.with_label("A CheckButton Widget");
        box2.add(checkbutton);
        var radiobutton = new Gtk.RadioButton.with_label(null, "A RadioButton Widget");
        box2.add(radiobutton);
    }

    private void on_button_clicked()
    {
        popover.show_all();
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
