/*
 * Selection of dates can be made using the Calendar widget, which provides a
 * number of customisation options to configure how the user can use it.
*/

using Gtk;

public class Example : Window
{
    private Calendar calendar;
    private CheckButton checkbuttonShowHeading;
    private CheckButton checkbuttonShowDays;
    private CheckButton checkbuttonNoChange;
    private CheckButton checkbuttonShowWeeks;

    public Example()
    {
        this.title = "Calendar";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Gtk.Grid();
        this.add(grid);

        calendar = new Gtk.Calendar();
        grid.attach(calendar, 0, 0, 1, 1);

        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 2);
        grid.attach(box, 1, 0, 1, 1);

        checkbuttonShowHeading = new Gtk.CheckButton.with_label("Show Heading");
        checkbuttonShowHeading.set_active(true);
        checkbuttonShowHeading.toggled.connect(on_show_heading_toggled);
        box.pack_start(checkbuttonShowHeading, false, false, 0);
        checkbuttonShowDays = new Gtk.CheckButton.with_label("Show Day Names");
        checkbuttonShowDays.set_active(true);
        checkbuttonShowDays.toggled.connect(on_show_days_toggled);
        box.pack_start(checkbuttonShowDays, false, false, 0);
        checkbuttonNoChange = new Gtk.CheckButton.with_label("Prevent Month/Year Change");
        checkbuttonNoChange.toggled.connect(on_no_change_toggled);
        box.pack_start(checkbuttonNoChange, false, false, 0);
        checkbuttonShowWeeks = new Gtk.CheckButton.with_label("Show Week Numbers");
        checkbuttonShowWeeks.toggled.connect(on_show_weeks_toggled);
        box.pack_start(checkbuttonShowWeeks, false, false, 0);
    }

    private void on_show_heading_toggled()
    {
        calendar.set_property("show-heading", checkbuttonShowHeading.get_active());
    }

    private void on_show_days_toggled()
    {
        calendar.set_property("show-day-names", checkbuttonShowDays.get_active());
    }

    private void on_no_change_toggled()
    {
        calendar.set_property("no-month-change", checkbuttonNoChange.get_active());
    }

    private void on_show_weeks_toggled()
    {
        calendar.set_property("show-week-numbers", checkbuttonShowWeeks.get_active());
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
