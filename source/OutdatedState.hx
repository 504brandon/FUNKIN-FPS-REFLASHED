package;

import openfl.net.URLLoader;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import lime.app.Application;
import flixel.FlxG;
import flixel.text.FlxText;

using StringTools;

class OutdatedState extends MusicBeatState {
    override public function create() {
        var curVersion:Dynamic = null;

        var http = new haxe.Http("https://raw.githubusercontent.com/504brandon/FUNKIN-FPS-REFLASHED/master/update.txt");

		http.onData = function(data:String)
		{
			curVersion = data.split('\n')[0].trim();
		}

		http.onError = function(error)
		{
			trace('error: $error');
		}

		http.request();

        FlxG.sound.playMusic(Paths.music('configurator'));

        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menu/menuDesat'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.setGraphicSize(Std.int(bg.width * 1.18));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = 0xFF23293F;
		add(bg);

        var text = new FlxText(0, 0, FlxG.width, 'Yo looks like your FPS PLUS - REFLASHED is outdated man your version is ${Application.current.meta.get('version').split('|')[2]} while the most recent version\nis $curVersion you can press enter to update your game or press your back key');
        text.setFormat(Paths.font('vcr'), 27, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.BLACK);
        text.screenCenter();
        add(text);
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (controls.ACCEPT)
            FlxG.openURL('https://github.com/504brandon/FUNKIN-FPS-REFLASHED');
        if (controls.BACK)
            FlxG.switchState(new title.TitleScreen());
    }
}