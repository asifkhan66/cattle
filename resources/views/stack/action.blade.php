<form method="POST"
      action="{!! route('stack.destroy', $stack->id) !!}"
      accept-charset="UTF-8">
    <input name="_method" value="DELETE" type="hidden">
    {{ csrf_field() }}

    @if (App\Helpers\CommonHelper::isCapable('stack.show'))
        <a href="{{ route('stack.show', $stack->id ) }}"
           class="btn btn-xs btn-info" title="{{__('buttonTitle.show_stack')}}">
            <i aria-hidden="true" class="fa fa-eye"></i>
        </a>
    @endif

    @if (App\Helpers\CommonHelper::isCapable('stack.edit'))
        <a href="{{ route('stack.edit', $stack->id ) }}"
           class="btn btn-xs btn-primary" title="{{__('buttonTitle.edit_stack')}}">
            <i aria-hidden="true" class="fa fa-pencil"></i>
        </a>
    @endif

    @if (App\Helpers\CommonHelper::isCapable('stack.destroy'))
        <button type="submit" class="btn btn-xs btn-danger"
                title="{{__('buttonTitle.delete_stack')}}"
                onclick="return confirm('Delete Country?')">
            <i aria-hidden="true" class="fa fa-trash"></i>
        </button>
    @endif
</form>
