defmodule StateMachine do
  defmacro __using__(_) do
    quote do
      import StateMachine
      @states []
      @before_name ""
      @before_compile StateMachine
    end
  end

  defmacro state(name, events) do
    quote do
      @states [{unquote(name), unquote(events)} | @states]
    end
  end

  defmacro __before_compile__(env) do
    states = Module.get_attribute(env.module, :states)
    events = states |> Keyword.values() |> List.flatten() |> Keyword.keys() |> Enum.uniq()

    quote do
      def state_machine do
        unquote(states)
      end

      unquote(events |> Enum.map(&event_callback/1))
    end
  end

  def event_callback(name) do
    before_name = :"before_#{name}"
    after_name = :"after_#{name}"

    quote do
      def unquote(name)(context) do
        context =
          if function_exported?(__MODULE__, unquote(before_name), 1) do
            apply(__MODULE__, unquote(before_name), [context])
          else
            context
          end

        context =
          if function_exported?(__MODULE__, :before, 2) do
            apply(__MODULE__, :before, [unquote(name), context])
          else
            context
          end

        context = StateMachine.Behavior.fire(state_machine(), context, unquote(name))

        context =
          if function_exported?(__MODULE__, :after, 2) do
            apply(__MODULE__, :after, [unquote(name), context])
          else
            context
          end

        context =
          if function_exported?(__MODULE__, unquote(after_name), 1) do
            apply(__MODULE__, unquote(after_name), [context])
          else
            context
          end

        context
      end
    end
  end
end
