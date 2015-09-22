/*
 * The ListBox widget provides a vertical container holding ListBoxRow children.
 * The children are created automatically when another widget is added.. The
 * container also provides sorting and filtering, allowing more complex layouts
 * than can be achieved via a CellRenderer.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "ListBox";
        this.destroy.connect(Gtk.main_quit);

        var listbox = new ListBox();
        this.add(listbox);

        for (var i = 1; i < 10; i++)
        {
            string text = @"Label $i";
            var label = new Label(text);
            listbox.add(label);
        }
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
