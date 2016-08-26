
/**************************************************************************************
***** Main Campaign Module                                                       ******
**************************************************************************************/

var PostenCosTopBanner = function (bannerInstance) {
    var _bannerScrollInterval = null;
    var _multiple;
    var _paused = false;
    function changeBanner(index, inAutoScroll) {
        var bannerPaginators = jQuery(bannerInstance).find(".paginator a");
        bannerPaginators.removeClass("active");
        bannerPaginators.eq(index).addClass("active");
        bannerPaginators.addClass("loading");

        var ulPages = jQuery(".mainCampaign ul");

        /*
        ulPages.children("li:visible").hide();
        ulPages.children("li").eq(index).show();
        bannerPaginators.removeClass("loading");
        */


        ulPages.children("li").filter(":visible").fadeOut(300, function () {
            ulPages.children("li").css('position', 'absolute');
            ulPages.children("li").eq(index).fadeIn(300);
            bannerPaginators.removeClass("loading");
        });

        if (!inAutoScroll && _multiple) {
            if (_bannerScrollInterval != null) {
                window.clearInterval(_bannerScrollInterval);
            }
            setBannerAutoScrollInterval();
        }
    }

    function setBannerAutoScrollInterval() {
        _bannerScrollInterval = window.setInterval(bannerAutoScroll, 5000);
    }

    function bannerAutoScroll() {
        var itemCount = jQuery(bannerInstance).find(".paginator > a").length;
        var index = parseInt(jQuery(bannerInstance).find(".paginator a.active").text()) - 1;

        if (_paused == false) {
            if (index == itemCount - 1) {
                changeBanner(0, true);
            } else {
                changeBanner(index + 1, true);
            }
        }
    }

    this.init = function () {
        jQuery(bannerInstance).find(".paginator a").click(function () {
            if (!jQuery(this).hasClass("active") && jQuery(bannerInstance).find(".paginator a.loading").length == 0)
                changeBanner(jQuery(this).index(), false);
        });

        _multiple = jQuery(bannerInstance).find(".paginator a").length > 1;
        if (_multiple) {
            setBannerAutoScrollInterval();


            var mainCampaign = jQuery(".mainCampaign");

            mainCampaign.find("*").mouseenter(function () {
                _paused = true;
            })
            .mouseout(function () {
                _paused = false;
            });
        }

    }

    this.init();
};