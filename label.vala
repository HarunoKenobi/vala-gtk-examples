/*
 * The Label is commonly used for basic purposes such as displaying short
 * amounts of text. It does however provide a number of extra features allowing
 * the display of complex text layouts.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Label";
        this.set_default_size(600, -1);
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        grid.set_border_width(5);
        grid.set_row_spacing(5);
        grid.set_column_spacing(5);
        this.add(grid);

        var label1 = new Label("An example of a Label widget.");
        label1.set_selectable(true);
        grid.attach(label1, 0, 0, 1, 1);
        var label2 = new Label("This is a label spread across multiple\nlines using the newspace character\nto indicate the line break.");
        grid.attach(label2, 0, 1, 1, 1);
        var label3 = new Label("Tab spaces\tcan also be\tdefined if required.");
        grid.attach(label3, 0, 2, 1, 1);
        var label4 = new Label("Label widgets can also accept underline patterns.");
        label4.set_pattern("_____                         _________");
        label4.set_line_wrap(true);
        grid.attach(label4, 0, 3, 1, 1);

        var label5 = new Label("Justification options are\nable to align text in the label,\nsuch as to the left.");
        label5.set_justify(Gtk.Justification.LEFT);
        grid.attach(label5, 1, 0, 1, 1);
        var label6 = new Label("Centering of text is possible\nto ensure that the margin\nof each sentence is even.");
        label6.set_justify(Gtk.Justification.CENTER);
        grid.attach(label6, 1, 1, 1, 1);
        var label7 = new Label("Text can also be right-justified\nto align to the right hand\nmargin of the label.");
        label7.set_justify(Gtk.Justification.RIGHT);
        grid.attach(label7, 1, 2, 1, 1);
        var label8 = new Label("Content is also justifiable to ensure that the sentences are evenly distributed. This ensures that the endings of each lines match. It does however require line wrapping to be enabled, and there are no manual breaks.");
        label8.set_line_wrap(true);
        label8.set_justify(Gtk.Justification.FILL);
        grid.attach(label8, 1, 3, 1, 1);

        var label9 = new Label("An angle can also be specified\nto orient the text.");
        label9.set_angle(90);
        grid.attach(label9, 2, 0, 1, 3);
        var label10 = new Label("<a href='http://programmica.com/'>A website link</a>");
        label10.set_use_markup(true);
        grid.attach(label10, 2, 3, 1, 1);
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
