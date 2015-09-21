/*
 * A SpinButton provides a way to enter numbers either by textual entry from the
 * user, or by changing the value with up/down buttons. Ranges to limit the
 * value entered are able to be set.
*/

using Gtk;

public class Example : Window
{
    private Switch gtkswitch;

    public Example()
    {
        this.title = "Switch";
        this.destroy.connect(Gtk.main_quit);

        gtkswitch = new Switch();
        gtkswitch.notify["active"].connect(on_switch_toggled);
        this.add(gtkswitch);
    }

    private void on_switch_toggled()
    {
        if (gtkswitch.get_active())
            stdout.printf("Switch toggled on\n");
        else
            stdout.printf("Switch toggled off\n");
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
