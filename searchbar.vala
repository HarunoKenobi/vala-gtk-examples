/*
 * The SearchBar is contains a SearchEntry widget, typically made to appear when
 * the user begins typing or enters a shortcut key on the application.
*/

using Gtk;

public class Example : Gtk.Window
{
    private Gtk.SearchEntry searchentry;
    private Gtk.SearchBar searchbar;

    public Example()
    {
        this.title = "SearchBar";
        this.key_press_event.connect(on_key_press_event);
        this.destroy.connect(Gtk.main_quit);

        searchbar = new Gtk.SearchBar();
        this.add(searchbar);

        searchentry = new Gtk.SearchEntry();
        searchentry.activate.connect(on_searchentry_activated);
        searchentry.search_changed.connect(on_searchentry_changed);
        searchbar.connect_entry(searchentry);
        searchbar.add(searchentry);

        this.show_all();
    }

    private bool on_key_press_event()
    {
        searchbar.set_search_mode(true);

        Gdk.Event event = get_current_event();

        return searchbar.handle_event(event);
    }

    public void on_searchentry_activated(Entry searchentry)
    {
        var text = searchentry.get_text();
        stdout.printf("%s\n", text);
    }

    public void on_searchentry_changed(SearchEntry searchentry)
    {
        if (searchentry.get_text_length() < 1)
        {
            searchbar.set_search_mode(false);
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
