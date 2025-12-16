config.load_autoconfig()

c.content.javascript.enabled = False
c.content.images = False

c.tabs.show = "switching"
c.statusbar.show = "never"

c.scrolling.smooth = True
c.scrolling.bar = "never"

config.unbind('m', mode='normal')
config.bind('m', 'mode-enter set_mark')
config.bind('`', 'mode-enter jump_mark')
