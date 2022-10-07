defmodule StateMachine do
  defmacro __using__(_) do
    quote do
      import StateMachine
      @states []
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
    quote do
      def unquote(name)(context) do
        StateMachine.Behavior.fire(state_machine(), context, unquote(name))
      end
    end
  end
end
