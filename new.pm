use Modern::Perl;
use Tk; 

my $light_count_1 = 1;


#Button Functions

sub light_ctrl_1
{
  if ($light_count_1 == 1)
  {
    my $var = "cd sketchbook && cd light_on && arduino-cli upload -p /dev/ttyACM0 -b arduino:avr:uno light_on.ino && cd .. && cd ..";
    system ($var);
    $light_count_1 = 0
  }
  else
  {
    my $var1 = "cd sketchbook && cd kill && arduino-cli upload -p /dev/ttyACM0 -b arduino:avr:uno kill.ino && cd .. && cd ..";
    system ($var1);
    $light_count_1 = 1
  }
}

#compiling arduino sketches
my $comp1="cd sketchbook && cd light_on && arduino-cli compile -b arduino:avr:uno light_on.ino && cd .. && cd ..";
system ($comp1);
my $comp2="cd sketchbook && cd kill && arduino-cli compile -b arduino:avr:uno kill.ino && cd .. && cd ..";
system ($comp2);

#Creating UI

my $main = new MainWindow;
$main->Label(-text => 'Hello, world!')->pack;
$main->Button(-text => 'Light!', -command => sub{light_ctrl_1})->pack;
MainLoop;
