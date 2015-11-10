/*
 * An InfoBar provides status messages for display to the user by embedding them
 * in the application interface.
*/

using Gtk;

public class Example : Window
{
    private InfoBar infobar;

    public Example()
    {
        this.title = "InfoBar";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        grid.set_row_spacing(5);
        grid.set_column_spacing(5);
        grid.set_column_homogeneous(true);
        this.add(grid);

        infobar = new InfoBar();
        infobar.set_show_close_button(true);
        infobar.response.connect(on_info_bar_closed);
        grid.attach(infobar, 0, 0, 4, 1);

        var content = infobar.get_content_area();
        var label = new Label("InfoBar content string.");
        content.add(label);

        var buttonInformation = new Button.with_label("Information");
        buttonInformation.clicked.connect(() => {on_info_type_clicked(Gtk.MessageType.INFO);});
        grid.attach(buttonInformation, 0, 1, 1, 1);

        var buttonQuestion = new Button.with_label("Question");
        buttonQuestion.clicked.connect(() => {on_info_type_clicked(Gtk.MessageType.QUESTION);});
        grid.attach(buttonQuestion, 1, 1, 1, 1);

        var buttonWarning = new Button.with_label("Warning");
        buttonWarning.clicked.connect(() => {on_info_type_clicked(Gtk.MessageType.WARNING);});
        grid.attach(buttonWarning, 2, 1, 1, 1);

        var buttonError = new Button.with_label("Error");
        buttonError.clicked.connect(() => {on_info_type_clicked(Gtk.MessageType.ERROR);});
        grid.attach(buttonError, 3, 1, 1, 1);
    }

    private void on_info_type_clicked(Gtk.MessageType type)
    {
        infobar.set_message_type(type);
        infobar.show();
    }

    private void on_info_bar_closed()
    {
        infobar.hide();
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
