#!/usr/bin/osascript -l JavaScript

var fm = $.NSFileManager.defaultManager;

function run(argv){
  var [path, opts] = parseArgv(argv);
  var img = getImagePath(path, opts.r);
  console.log(img);
  setImage(img);
}

function parseArgv(argv){
  var path = null;
  var opts = {};
  argv.forEach(function(arg){
    var match = arg.match(/^\-+(.+)$/);
    if(match){
      opts[match[1]] = true;
    }
    else{
      path = arg;
    }
  });
  return [path, opts];
}

function getImagePath(path, recursive){
  if(!path) return;
  var ref = Ref();
  var exists = fm.fileExistsAtPathIsDirectory(path, ref);
  if(!exists) return;
  var isDirecotry = ref[0];
  if(!isDirecotry) return path;
  var files = getImagesInDirectory(path, recursive);
  return files[Math.floor(Math.random()*files.length)];
}

function getImagesInDirectory(path, recursive){
  path = path.replace(/\/$/, "");
  var app = Application.currentApplication();
  app.includeStandardAdditions = true;
  var files = [];
  if(recursive){
    files = app.doShellScript("find '"+path+"'").split(/\r/);
  }
  else{
    files = app.doShellScript("ls '"+path+"'").split(/\r/)
      .map(function(f){
        return path+"/"+f;
      });
  }
  return files.filter(function(f){
    return /\.(jpe?g|gif|png|bmp)$/i.test(f);
  });
}

function setImage(img){
  Application("iTerm2").currentWindow.currentSession.backgroundImage = img || null;
}
