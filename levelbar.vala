/*
 * A LevelBar is used to indicate the level (of a battery charge for example),
 * with a specified allowable range
*/

using Gtk;

public class Example : Window
{
    private LevelBar levelbar;

    public Example()
    {
        this.title = "LevelBar";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Gtk.Grid();
        this.add(grid);

        levelbar = new Gtk.LevelBar();
        levelbar.set_min_value(0);
        levelbar.set_max_value(10);
        grid.attach(levelbar, 0, 0, 2, 1);

        var buttonIncrease = new Gtk.Button.with_label("Increase");
        buttonIncrease.clicked.connect(on_button_increase_clicked);
        grid.attach(buttonIncrease, 0, 1, 1, 1);
        var buttonDecrease = new Gtk.Button.with_label("Decrease");
        buttonDecrease.clicked.connect(on_button_decrease_clicked);
        grid.attach(buttonDecrease, 1, 1, 1, 1);
    }

    private void on_button_increase_clicked(Button button)
    {
        var current = levelbar.get_value();

        if (current < 10)
            levelbar.set_value(current + 1);
    }

    private void on_button_decrease_clicked(Button button)
    {
        var current = levelbar.get_value();

        if (current > 0)
            levelbar.set_value(current - 1);
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
