<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{ asset('/images/head.jpg').'?v='.env('VERSION') }}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>{{ isset(session('user')[0]['admin_name']) ? session('user')[0]['admin_name'] : '' }} {{ isset(session('user')[0]['real_name']) ? session('user')[0]['real_name'] : '' }}</p>
                <a href="javascript:void(0);"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                        </button>
                    </span>
            </div>
        </form>
        <ul class="sidebar-menu">
            <!-- 权限管理 -->
            @include('home.left-menu.left-admin')
            <!-- 统计管理 -->
            @include('home.left-menu.left-statistics')
        </ul>
    </section>
</aside>