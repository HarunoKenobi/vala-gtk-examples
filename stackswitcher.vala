/*
 * The Stack widget is similar to a Notebook in providing a container where the
 * visible object can be changed. On its own however, a Stack does not provide
 * a way for the user to change what is visible.
*/

using Gtk;

public class Example : Window
{
    private Stack stack;

    public Example()
    {
        this.title = "Stack";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        var stackswitcher = new StackSwitcher();
        grid.attach(stackswitcher, 0, 0, 1, 1);

        stack = new Stack();
        stack.set_vexpand(true);
        stack.set_hexpand(true);
        stackswitcher.set_stack(stack);
        grid.attach(stack, 0, 1, 1, 1);

        var label1 = new Label("Page 1 of Stack");
        stack.add_titled(label1, "Page1", "Page 1");

        var label2 = new Label("Page 2 of Stack");
        stack.add_titled(label2, "Page2", "Page 2");
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.set_default_size(200, 200);
        window.show_all();

        Gtk.main();

        return 0;
    }
}