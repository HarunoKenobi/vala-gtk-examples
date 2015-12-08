/*
 * A ProgressBar is used to indicate the amount of a long-running progress that
 * has completed.
*/

using Gtk;
using GLib;

public class Example : Window
{
    private ProgressBar progressbar;
    private CheckButton checkbutton;

    public Example()
    {
        this.title = "ProgressBar";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        progressbar = new ProgressBar();
        progressbar.set_hexpand(true);
        grid.attach(progressbar, 0, 0, 1, 1);

        checkbutton = new CheckButton.with_label("Show Text");
        checkbutton.toggled.connect(on_show_text_toggled);
        grid.attach(checkbutton, 0, 1, 1, 1);

        GLib.Timeout.add (500, progressbar_fill);
    }

    private bool progressbar_fill()
    {
        double amount = progressbar.get_fraction();

        if (amount < 1.0)
            progressbar.set_fraction(amount + 0.1);
        else
            progressbar.set_fraction(0.0);

        return true;
    }

    private void on_show_text_toggled(Gtk.ToggleButton checkbutton)
    {
        progressbar.set_show_text(checkbutton.get_active());
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
