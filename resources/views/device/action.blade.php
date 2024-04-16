<form method="POST"
      action="{!! route('device.destroy', $device->id) !!}"
      accept-charset="UTF-8">
    <input name="_method" value="DELETE" type="hidden">
    {{ csrf_field() }}

    @if (App\Helpers\CommonHelper::isCapable('device.show'))
        <a href="{{ route('device.show', $device->id ) }}"
           class="btn btn-xs btn-info" title="{{__('buttonTitle.show_device')}}">
            <i aria-hidden="true" class="fa fa-eye"></i>
        </a>
    @endif

    @if (App\Helpers\CommonHelper::isCapable('device.edit'))
        <a href="{{ route('device.edit', $device->id ) }}"
           class="btn btn-xs btn-primary" title="{{__('buttonTitle.edit_device')}}">
            <i aria-hidden="true" class="fa fa-pencil"></i>
        </a>
    @endif

    @if (App\Helpers\CommonHelper::isCapable('device.destroy'))
        <button type="submit" class="btn btn-xs btn-danger"
                title="{{__('buttonTitle.delete_device')}}"
                onclick="return confirm('Delete Country?')">
            <i aria-hidden="true" class="fa fa-trash"></i>
        </button>
    @endif
</form>
