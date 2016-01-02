/*
 * A MessageDialog is used to display important messages to the user, by popping
 * up a dialog. The type of message can be a question, error, warning or
 * informational.
*/

using Gtk;

public class Example : Window
{
    private Gtk.MessageDialog messagedialog;
    private Gtk.MessageType message;

    public Example()
    {
        this.title = "MessageDialog";
        this.destroy.connect(Gtk.main_quit);

        message = Gtk.MessageType.INFO;

        var buttonbox = new ButtonBox(Gtk.Orientation.HORIZONTAL);
        this.add(buttonbox);

        var buttonInformation = new Button.with_label("Information");
        buttonInformation.clicked.connect(() => {this.message = Gtk.MessageType.INFO; on_button_clicked();});
        buttonbox.add(buttonInformation);
        var buttonQuestion = new Button.with_label("Question");
        buttonQuestion.clicked.connect(() => {this.message = Gtk.MessageType.QUESTION; on_button_clicked();});
        buttonbox.add(buttonQuestion);
        var buttonWarning = new Button.with_label("Warning");
        buttonWarning.clicked.connect(() => {this.message = Gtk.MessageType.WARNING; on_button_clicked();});
        buttonbox.add(buttonWarning);
        var buttonError = new Button.with_label("Error");
        buttonError.clicked.connect(() => {this.message = Gtk.MessageType.ERROR; on_button_clicked();});
        buttonbox.add(buttonError);
        var buttonOther = new Button.with_label("Other");
        buttonOther.clicked.connect(() => {this.message = Gtk.MessageType.OTHER; on_button_clicked();});
        buttonbox.add(buttonOther);
    }

    private void on_button_clicked()
    {
        messagedialog = new Gtk.MessageDialog(this,
                                          Gtk.DialogFlags.MODAL,
                                          message,
                                          Gtk.ButtonsType.CLOSE,
                                          "MessageDialog displaying a message to the user.");
        messagedialog.set_title("MessageDialog");
        messagedialog.run();
        messagedialog.destroy();
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
