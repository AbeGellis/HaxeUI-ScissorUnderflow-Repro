package;

import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

@:xml('
<vbox width="100%" height="100%">
    <hbox width="100%">
        <label text="Row Header 1" />
        <textfield />
    </hbox>
    <hbox width="100%">
        <label text="Row Header 2" />
        <tableview id="signalInputs" width="100%" height="100%" contentWidth="100%">
            <header width="100%">
                <column id="colA" text="Column A" width="100%" />
            </header>
            
            <item-renderer verticalAlign="center">
                <label id="colA" />
            </item-renderer>

            <data>
                <item colA="Value A" />
            </data>
        </tableview>
    </hbox>
</vbox>
')
class LayoutBreaker extends haxe.ui.containers.VBox {}

class Main {
    public static function main() {
        kha.System.start({}, function ( _ ) {
            kha.Assets.loadEverything(function() {
                haxe.ui.Toolkit.init();

                final screen = haxe.ui.core.Screen.instance;
                final ui = new LayoutBreaker();
                screen.addComponent(ui);

                kha.System.notifyOnFrames(function( framebuffers: Array<kha.Framebuffer> ) {
                    final fb = framebuffers[0];
                    final g2 = fb.g2;
                    g2.begin(true, kha.Color.White);
                        screen.renderTo(g2);
                    g2.end();
                });
            });
        });
    }
}