/*
 * The SizeGroup object allows widgets to be sized equally either vertically,
 * horizontally, or in both directions.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "SizeGroup";
        this.destroy.connect(Gtk.main_quit);

        var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
        this.add(box);

        var sizegroup = new SizeGroup(Gtk.SizeGroupMode.BOTH);

        var button1 = new Gtk.Button.with_label("Button");
        sizegroup.add_widget(button1);
        box.pack_start(button1, false, false, 0);
        var button2 = new Gtk.Button.with_label("Button with longer label");
        sizegroup.add_widget(button2);
        box.pack_start(button2, false, false, 0);
        var button3 = new Gtk.Button.with_label("Button with longer label\nand line break");
        sizegroup.add_widget(button3);
        box.pack_start(button3, false, false, 0);
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
