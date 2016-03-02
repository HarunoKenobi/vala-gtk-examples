/*
 * A Dialog provides a Window-like interface on which popup dialogs can be
 * built. It provides an action area for buttons to be added, and customisation
 * on behaviour such as hiding from the titlebar.
*/

using Gtk;

public class Example : Dialog
{
    public Example()
    {
        this.title = "Dialog";
        this.set_default_size(400, 300);
        this.destroy.connect(Gtk.main_quit);
        this.add_button("_OK", Gtk.ResponseType.OK);
        this.add_button("_Cancel", Gtk.ResponseType.CANCEL);
        this.set_default_response(Gtk.ResponseType.OK);
        this.response.connect(on_response);

        var vbox = this.get_content_area();

        var label = new Label("This is a Dialog example.");
        vbox.add(label);

        this.show_all();
    }

    private void on_response(Dialog dialog, int response)
    {
        if (response == Gtk.ResponseType.OK)
            stdout.printf("OK button clicked");
        else if (response == Gtk.ResponseType.CANCEL)
            stdout.printf("Cancel button clicked");
        else
            stdout.printf("Dialog closed");

        stdout.printf("\n");

        this.destroy();
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var dialog = new Example();
        dialog.show();

        Gtk.main();

        return 0;
    }
}
