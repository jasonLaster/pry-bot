require 'pry'
require 'json'

module Render
  def self.render
    commands = Pry.commands
    ls_klass = commands.find_command('ls')

    ls_klass.class_eval do
      def render
        resp = {}

        if @show_globals
          resp['global'] = @globals
        end

        if @show_constants
          resp['constants'] = @constants
        end

        if @show_methods
          resp['methods_mro'] = {}
          @methods_mro.each do |level|
            resp['methods_mro'][level[:klass_prefix]] = level[:methods]
          end
        end

        if @show_self_methods
          resp['@self_prefix'] = @self_methods
        end

        if @show_ivars
          resp['instance_var'] = @ivars
          resp['class_var'] = @kvars
        end

        if @show_locals
          resp['locals'] = @local_vars
        end

        output.puts resp.to_json
        Pry.hooks.exec_hook :after_print
      end
    end
  end
end