/*
 * An Entry is used to receive and display short lines of text, with functions
 * to handle the data.
*/

using Gtk;

public class EntryExample : Window
{
    public EntryExample()
    {
        this.title = "Entry";
        this.destroy.connect(Gtk.main_quit);

        var entry = new Entry();
        entry.set_placeholder_text("Enter some text...");
        entry.activate.connect(on_entry_activated);
        this.add(entry);
    }

    public void on_entry_activated(Gtk.Entry entry)
    {
        var text = entry.get_text();
        stdout.printf("%s\n", text);
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new EntryExample();
        window.show_all();

        Gtk.main();

        return 0;
    }
}
