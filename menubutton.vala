/*
 * A MenuButton provides a standard Button-like widget but when clicked displays
 * a menu with associated actions.
*/

using Gtk;

public class Example : Window
{
    private MenuButton menubutton;

    public Example()
    {
        this.title = "MenuButton";
        this.destroy.connect(Gtk.main_quit);

        menubutton = new MenuButton();
        menubutton.set_label("MenuButton");
        this.add(menubutton);

        var menu = new Gtk.Menu();
        menubutton.set_popup(menu);

        for (var i = 1; i < 6; i++)
        {
            string text = @"MenuItem $i";
            var menuitem = new Gtk.MenuItem.with_label(text);
            menuitem.activate.connect(on_menuitem_activated);
            menu.add(menuitem);
        }

        menu.show_all();
    }

    private void on_menuitem_activated(Gtk.MenuItem menuitem)
    {
        var label = menuitem.get_label();
        stdout.printf("%s was clicked!\n", label);
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
