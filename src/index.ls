module.exports = class SomeStylesheetCompiler
  brunchPlugin: yes
  type: 'stylesheet'
  extension: 'css'

  (config) -> @files = config.plugins.stylesheets

  isValid: ->
    # XXX not sure if it's the same directory for CSS
    it in @files or 0 is it.indexOf 'vendor/scripts/brunch'

  compile: !(data, path, callback) ->
    try
      path.=replace /\\/g '/' #'
      callback null, if @isValid path
        data
      else null
    catch
      callback e