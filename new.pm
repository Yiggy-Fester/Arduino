use Modern::Perl;
use Tk; 

#Creating functiuons

sub light_on
{
  my $var = "cd sketchbook && cd light_on && arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno light_on.ino && cd";
  system ($var);
}
sub light_off
{
  my $var1 = "cd sketchbook && cd kill && arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno kill.ino && cd";
  system ($var1);
}

#compiling arduino sketches
my $comp1="cd sketchbook && cd light_on && arduino-cli compile --fqbn arduino:avr:uno light_on.ino && cd";
system ($comp1);
my $comp2="cd sketchbook && cd kill && arduino-cli compile --fqbn arduno:avr:uno kill.ino && cd";
system ($comp2);

#Creating UI

my $main = new MainWindow;
$main->Label(-text => 'Hello, world!')->pack;
$main->Button(-text => 'Light on!', -command => sub{light_on})->pack;
$main->Button(-text => 'Light off!', -command => sub{light_off})->pack;
MainLoop;
