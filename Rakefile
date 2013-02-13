# -*- coding: utf-8 -*-
$:.unshift "/Library/RubyMotion/lib"
require 'motion/project'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  app.name = "Cocos2D"

  app.frameworks += %w[
    AVFoundation
    AudioToolbox
    OpenAL
    OpenGLES
    QuartzCore
  ]

  app.libs += %w[
    /usr/lib/libz.dylib
  ]

  app.pods do
    pod 'cocos2d'
  end
end
