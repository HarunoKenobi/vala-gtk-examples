/*
 * Coupled with an Entry, the EntryCompletion object provides matching of text
 * to a list of entries, allowing the user to select a pre-entered value rather
 * than typing.
*/

using Gtk;

public class EntryExample : Window
{
    private Gtk.ListStore liststore;
    private Entry entry;
    private EntryCompletion entrycompletion;

    public EntryExample()
    {
        this.title = "EntryCompletion";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        entry = new Entry();
        grid.attach(entry, 0, 0, 1, 1);

        liststore = new Gtk.ListStore(1, typeof(string));

        Gtk.TreeIter iter;
        liststore.append(out iter);
        liststore.set(iter, 0, "Oklahoma");
        liststore.append(out iter);
        liststore.set(iter, 0, "California");
        liststore.append(out iter);
        liststore.set(iter, 0, "Texas");
        liststore.append(out iter);
        liststore.set(iter, 0, "Connecticut");
        liststore.append(out iter);
        liststore.set(iter, 0, "Arizona");

        entrycompletion = new EntryCompletion();
        entrycompletion.set_model(liststore);
        entrycompletion.set_text_column(0);
        entrycompletion.set_popup_completion(true);
        entry.set_completion(entrycompletion);

        var radiobuttonPopup = new RadioButton.with_label(null, "Popup Completion");
        radiobuttonPopup.toggled.connect(on_popup_completion);
        grid.attach(radiobuttonPopup, 1, 0, 1, 1);

        var radiobuttonInline = new RadioButton.with_label(radiobuttonPopup.get_group(), "Inline Completion");
        radiobuttonInline.toggled.connect(on_inline_completion);
        grid.attach(radiobuttonInline, 2, 0, 1, 1);
    }

    private void on_popup_completion(Gtk.ToggleButton radiobutton)
    {
        if (radiobutton.get_active())
        {
            entrycompletion.set_popup_completion(true);
            entrycompletion.set_inline_completion(false);
        }
    }

    private void on_inline_completion(Gtk.ToggleButton radiobutton)
    {
        if (radiobutton.get_active())
        {
            entrycompletion.set_popup_completion(false);
            entrycompletion.set_inline_completion(true);
        }
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
