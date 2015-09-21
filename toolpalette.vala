/*
 * A ToolPalette is commonly used in complex applications as a replacement for
 * the Toolbar. It is suitable for holding many icons, typically grouped into
 * related sections.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.set_default_size(200, 300);
        this.title = "ToolPalette";
        this.destroy.connect(Gtk.main_quit);

        var toolpalette = new Gtk.ToolPalette();
        this.add(toolpalette);

        var toolitemgroup1 = new Gtk.ToolItemGroup("File");
        toolpalette.add(toolitemgroup1);

        var toolbutton1 = new Gtk.ToolButton(null, "New");
        toolbutton1.set_icon_name("gtk-new");
        toolitemgroup1.insert(toolbutton1, 0);
        var toolbutton2 = new Gtk.ToolButton(null, "Open");
        toolbutton2.set_icon_name("gtk-open");
        toolitemgroup1.insert(toolbutton2, 1);
        var toolbutton3 = new Gtk.ToolButton(null, "Save");
        toolbutton3.set_icon_name("gtk-save");
        toolitemgroup1.insert(toolbutton3, 2);

        var toolitemgroup2 = new Gtk.ToolItemGroup("Tools");
        toolpalette.add(toolitemgroup2);

        var toolbutton4 = new Gtk.ToolButton(null, "Find");
        toolbutton4.set_icon_name("gtk-find");
        toolitemgroup2.insert(toolbutton4, 0);
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
