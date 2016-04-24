/*
 * An Assistant provides a step-by-step walkthrough to guide a user. It is often
 * used for initial setup of an application or settings, which requires a set of
 * information.
*/

using Gtk;

public class Example : Assistant
{
    private Gtk.CheckButton checkbutton;
    private Gtk.Box complete;

    public Example()
    {
        this.title = "Assistant";
        this.set_default_size(400, -1);
        this.cancel.connect(on_cancel_clicked);
        this.close.connect(on_close_clicked);
        this.apply.connect(on_apply_clicked);

        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.append_page(box);
        this.set_page_type(box, Gtk.AssistantPageType.INTRO);
        this.set_page_title(box, "Page 1: Introduction");
        var label = new Gtk.Label("An 'Intro' page is the first page of an Assistant. It is used to provide information about what configuration settings need to be configured. The introduction page only has a 'Continue' button.");
        label.set_line_wrap(true);
        box.pack_start(label, true, true, 0);
        this.set_page_complete(box, true);

        var box2 = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.append_page(box2);
        this.set_page_type(box2, Gtk.AssistantPageType.CONTENT);
        this.set_page_title(box2, "Page 2: Content");
        var label2 = new Gtk.Label("The 'Content' page provides a place where widgets can be positioned. This allows the user to configure a variety of options as needed. The page contains a 'Continue' button to move onto other pages, and a 'Go Back' button to return to the previous page if necessary.");
        label2.set_line_wrap(true);
        box2.pack_start(label2, true, true, 0);
        this.set_page_complete(box2, true);

        complete = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.append_page(complete);
        this.set_page_type(complete, Gtk.AssistantPageType.PROGRESS);
        this.set_page_title(complete, "Page 3: Progress");
        var label3 = new Gtk.Label("A 'Progress' page is used to prevent changing pages within the Assistant before a long-running process has completed. The 'Continue' button will be marked as insensitive until the process has finished. Once finished, the button will become sensitive.");
        label3.set_line_wrap(true);
        complete.pack_start(label3, true, true, 0);
        checkbutton = new Gtk.CheckButton.with_label("Mark Page As Complete");
        checkbutton.toggled.connect(on_complete_toggled);
        complete.pack_start(checkbutton, false, false, 0);

        var box3 = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.append_page(box3);
        this.set_page_type(box3, Gtk.AssistantPageType.CONFIRM);
        this.set_page_title(box3, "Page 3: Confirm");
        var label4 = new Gtk.Label("The 'Confirm' page may be set as the final page in the Assistant, however this depends on what the Assistant does. This page provides an 'Apply' button to explicitly set the changes, or a 'Go Back' button to correct any mistakes.");
        label4.set_line_wrap(true);
        box3.pack_start(label4, true, true, 0);
        this.set_page_complete(box3, true);

        var box4 = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.append_page(box4);
        this.set_page_type(box4, Gtk.AssistantPageType.SUMMARY);
        this.set_page_title(box4, "Page 4: Summary");
        var label5 = new Gtk.Label("A 'Summary' should be set as the final page of the Assistant if used however this depends on the purpose of your Assistant. It provides information on the changes that have been made during the configuration or details of what the user should do next. On this page only a Close button is displayed. Once at the Summary page, the user cannot return to any other page.");
        label5.set_line_wrap(true);
        box4.pack_start(label5, true, true, 0);
        this.set_page_complete(box4, true);
    }

    private void on_complete_toggled()
    {
        var active = checkbutton.get_active();

        this.set_page_complete(complete, active);
    }

    private void on_cancel_clicked(Gtk.Assistant assistant)
    {
        stdout.printf("The Assistant has been cancelled.\n");
        Gtk.main_quit();
    }

    private void on_close_clicked(Gtk.Assistant assistant)
    {
        stdout.printf("The 'Close' button has been clicked.\n");
        Gtk.main_quit();
    }

    private void on_apply_clicked(Gtk.Assistant assistant)
    {
        stdout.printf("The 'Apply' button has been clicked.\n");
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var assistant = new Example();
        assistant.show_all();

        Gtk.main();

        return 0;
    }
}
