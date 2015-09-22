/*
 * The FlowBox positions child widgets either horizontally or vertically
 * depending on how much size the container is allocated. Widgets are moved
 * dynamically as the container changes size and shape.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "FlowBox";
        this.destroy.connect(Gtk.main_quit);

        var flowbox = new FlowBox();
        this.add(flowbox);

        for (var i = 1; i < 10; i++)
        {
            string text = @"Label $i";
            var label = new Label(text);
            flowbox.add(label);
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
