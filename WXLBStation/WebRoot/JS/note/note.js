/**
 * Created by wangjian1 on 2016-6-13.
 */
$(function () {
    var router = new Router({
        container: '#container',
        enterTimeout: 250,
        leaveTimeout: 250
    });
    var notice = {
        url: '/',
        className: 'notice',
        render: function () {
            return $('#notice').html();
        }
    };
    var dcxy = {
        url: '/',
        className: 'dcxy',
        render: function () {
            return $('#dcxy').html();
        }
    };
    var zsgz = {
        url: '/',
        className: 'zsgz',
        render: function () {
            return $('#zsgz').html();
        }
    };
    var jyzd = {
        url: '/',
        className: 'jyzd',
        render: function () {
            return $('#jyzd').html();
        }
    };
    var cyzd = {
        url: '/',
        className: 'cyzd',
        render: function () {
            return $('#cyzd').html();
        }
    };
    var type = $("#type").val();
    if ("1" == type) {
        router.push(notice)
            .setDefault('/')
            .init();
    } else if ("2" == type) {
        router.push(dcxy)
            .setDefault('/')
            .init();
    } else if ("3" == type) {
        router.push(zsgz)
            .setDefault('/')
            .init();
    } else if ("4" == type) {
        router.push(jyzd)
            .setDefault('/')
            .init();
    } else if ("5" == type) {
        router.push(cyzd)
            .setDefault('/')
            .init();
    }


    // .container 设置了 overflow 属性, 导致 Android 手机下输入框获取焦点时, 输入法挡住输入框的 bug
    // 相关 issue: https://github.com/weui/weui/issues/15
    // 解决方法:
    // 0. .container 去掉 overflow 属性, 但此 demo 下会引发别的问题
    // 1. 参考 http://stackoverflow.com/questions/23757345/android-does-not-correctly-scroll-on-input-focus-if-not-body-element
    //    Android 手机下, input 或 textarea 元素聚焦时, 主动滚一把
    if (/Android/gi.test(navigator.userAgent)) {
        window.addEventListener('resize', function () {
            if (document.activeElement.tagName == 'INPUT' || document.activeElement.tagName == 'TEXTAREA') {
                window.setTimeout(function () {
                    document.activeElement.scrollIntoViewIfNeeded();
                }, 0);
            }
        })
    }
});