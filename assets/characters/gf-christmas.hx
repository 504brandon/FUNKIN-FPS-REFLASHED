function create()
{
	character.frames = Paths.getSparrowAtlas("week5/gfChristmas");
	character.animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
	character.animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
	character.animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

	character.addOffset('sad', 0, -21);
	character.addOffset('danceLeft', 0, -9);
	character.addOffset('danceRight', 0, -9);
	character.playAnim('danceRight');
}

var danced = false;

function dance()
{
	danced = !danced;

	if (danced)
		character.playAnim('danceRight', true);
	else
		character.playAnim('danceLeft', true);
}