/*
 * The EntryBuffer object provides a way to store text held in an Entry, with
 * functionality for handling the text and sharing to other Entry widgets.
*/

using Gtk;

public class Example : Window
{
    private Entry entry;
    private EntryBuffer entrybuffer;

    public Example()
    {
        this.title = "EntryBuffer";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        unowned uint8[] text = (uint8[]) "Entry with EntryBuffer";
        entrybuffer = new EntryBuffer(text);

        entry = new Entry();
        entry.set_buffer(entrybuffer);
        grid.attach(entry, 0, 0, 1, 1);

        entry = new Entry();
        entry.set_buffer(entrybuffer);
        grid.attach(entry, 0, 1, 1, 1);

        entry = new Entry();
        entry.set_buffer(entrybuffer);
        grid.attach(entry, 0, 2, 1, 1);
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
