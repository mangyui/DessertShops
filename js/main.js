(function($) {
    'use strict';
    var isMobile = {
        Android: function() {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function() {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function() {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function() {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function() {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function() {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
    }

    function masonry() {
        var masonryTrigger = $('.ps-masonry');
        if (masonryTrigger.length > 0) {
            masonryTrigger.imagesLoaded(function() {
                masonryTrigger.masonry({
                    columnWidth: '.grid-sizer',
                    itemSelector: '.grid-item'
                });
            });
            var filters = masonryTrigger.closest('.ps-section--masonry').find('.ps-masonry__filter');

            filters.on('click', 'a', function() {
                var selector = $(this).attr('data-filter');
                filters.find('a').removeClass('current');
                $(this).addClass('current');
                masonryTrigger.masonry({
                    itemSelector: '.grid-item',
                    masonry: {
                        columnWidth: '.grid-sizer'
                    },
                    filter: selector
                });

                return false;
            });
        }
    }

    function backgroundImage() {
        var databackground = $('[data-background]');
        databackground.each(function() {
            if ($(this).attr('data-background')) {
                var image_path = $(this).attr('data-background');
                $(this).css({
                    'background': 'url(' + image_path + ')'
                });
            }
        });
    }

    function parallax() {
        $('.bg--parallax').each(function() {
            var el = $(this),
                xpos = "50%",
                windowHeight = $(window).height();
            if (isMobile.any()) {
                $(this).css('background-attachment', 'scroll');
            } else {
                $(window).scroll(function() {
                    var current = $(window).scrollTop(),
                        top = el.offset().top,
                        height = el.outerHeight();
                    if (top + height < current || top > current + windowHeight) {
                        return;
                    }
                    el.css('backgroundPosition', xpos + " " + Math.round((top - current) * 0.15) + "px");
                });
            }
        });
    }

    function owlCarousel(target) {
        if (target.length > 0) {
            target.each(function() {
                var el = $(this),
                    dataAuto = el.data('owl-auto'),
                    dataLoop = el.data('owl-loop'),
                    dataSpeed = el.data('owl-speed'),
                    dataGap = el.data('owl-gap'),
                    dataNav = el.data('owl-nav'),
                    dataDots = el.data('owl-dots'),
                    dataAnimateIn = el.data('owl-animate-in'),
                    dataAnimateOut = el.data('owl-animate-out'),
                    dataDefaultItem = el.data('owl-item'),
                    dataItemXS = el.data('owl-item-xs'),
                    dataItemSM = el.data('owl-item-sm'),
                    dataItemMD = el.data('owl-item-md'),
                    dataItemLG = el.data('owl-item-lg'),
                    dataNavLeft = el.data('owl-nav-left'),
                    dataNavRight = el.data('owl-nav-right');

                el.owlCarousel({
                    animateIn: dataAnimateIn,
                    animateOut: dataAnimateOut,
                    margin: dataGap,
                    autoplay: dataAuto,
                    autoplayTimeout: dataSpeed,
                    autoplayHoverPause: true,
                    loop: dataLoop,
                    nav: dataNav,
                    mouseDrag: true,
                    touchDrag: true,
                    navText: [dataNavLeft, dataNavRight],
                    dots: dataDots,
                    items: dataDefaultItem,
                    responsive: {
                        0: {
                            items: dataItemXS
                        },
                        480: {
                            items: dataItemSM
                        },
                        768: {
                            items: dataItemMD
                        },
                        992: {
                            items: dataItemLG
                        },
                        1200: {
                            items: dataDefaultItem
                        }
                    }
                });
            });
        }
    }

    function syncCarousel(main, thumbnail, duration) {
        var flag = false;
        var target = thumbnail.find('.owl-item');
        target.first().addClass('current');
        main.on('changed.owl.carousel', function(e) {
            thumbnail.find('.owl-item').removeClass('current');
            thumbnail.find('.owl-item').eq(e.item.index).addClass('current');
            if (!flag) {
                flag = true;
                thumbnail.trigger('to.owl.carousel', [e.item.index, duration, true]);
                flag = false;
            }
        });
        thumbnail.on('click', '.owl-item', function() {
            main.trigger('to.owl.carousel', [$(this).index(), duration, true]);

        }).on('changed.owl.carousel', function(e) {
            if (!flag) {
                flag = true;
                main.trigger('to.owl.carousel', [e.item.index, duration, true]);
                flag = false;
            }
        });
    }

    function menuBtnToggle() {
        var toggleBtn = $('.menu-toggle');
        var sidebar = $('.header--sidebar');
        toggleBtn.on('click', function(event) {
            var self = $(this);
            if (!self.hasClass('menu-toggle--active')) {
                self.addClass('menu-toggle--active');
                sidebar.addClass('active');
                $('.page-wrap, .header').addClass('menu-sidebar--active');
            } else {
                self.removeClass('menu-toggle--active');
                sidebar.removeClass('active');
                $('.page-wrap, .header').removeClass('menu-sidebar--active');
            }
        });
        $('.page-wrap').on('click', function(e) {
            sidebar.removeClass('active');
            $('.page-wrap, .header').removeClass('menu-sidebar--active');
            toggleBtn.removeClass('menu-toggle--active');
        });
    }

    function subMenuToggle() {
        $('body').on('click', '.menu--mobile .menu-item-has-children > a', function(event) {
            event.preventDefault();
            var current = $(this).parent('.menu-item-has-children')
            current.children('.sub-menu').slideToggle(300);
            current.siblings().find('.sub-menu').slideUp(300);
        });
    }

    function resizeHeader() {
        var header = $('.header')
        var checkPoint = header.data('responsive');
        var windowWidth = $(window).innerWidth();
        // mobile
        if (checkPoint > windowWidth) {
            $('.menu').find('.sub-menu').hide();
            header.find('.menu').addClass('menu--mobile');
            $('.menu').prependTo('.header--sidebar');
            $('#Use').addClass("minUse").prependTo('.header--sidebar');
            $(".Myps-product--list").css("margin-right","0");
        } else {
            $('.menu').find('.sub-menu').show();
            header.removeClass('header--mobile');
            header.find('.menu').removeClass('menu--mobile');
            $('.menu--left').prependTo('.navigation__left');
            $('.menu--right').prependTo('.navigation__right');
            $('#Use').removeClass("minUse").prependTo('.navigation__right');
            $('body').removeClass('menu-sidebar--active');
            $('.header--sidebar').removeClass('active');
            $('.menu-toggle').removeClass('menu-toggle--active');
            $(".Myps-product--list").css("margin-right","2%");
        }
    }

    function stickyHeader() {
        var header = $('.header'),
            scrollPosition = 0,
            headerTopHeight = $('.header .header__top').outerHeight(),
            checkpoint = 300;
        $(window).scroll(function(event) {
            var currentPosition = $(this).scrollTop();
            if (currentPosition < scrollPosition) {
                // On top
                if (currentPosition == 0) {
                    header.removeClass('navigation--sticky navigation--unpin navigation--pin');
                    header.css("margin-top", 0);
                }
                // on scrollUp
                else if (currentPosition > checkpoint) {
                    header.removeClass('navigation--unpin').addClass('navigation--sticky navigation--pin');

                }
            }
            // On scollDown
            else {
                header.removeClass('navigation--unpin').addClass('navigation--sticky navigation--pin');
                    header.css("margin-top", -headerTopHeight);
            }
            scrollPosition = currentPosition;
        });
    }

    function mapConfig() {
        $.gmap3({
            key: 'AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg'
        });
        var map = $('#contact-map');
        if (map.length > 0) {
            map.gmap3({
                address: map.data('address'),
                zoom: map.data('zoom'),
                scrollwheel: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                scrollwheel: false,
                styles: [{
                    "featureType": "administrative",
                    "elementType": "all",
                    "stylers": [{"visibility": "on"}, {"lightness": 33}]
                }, {
                    "featureType": "landscape",
                    "elementType": "all",
                    "stylers": [{"color": "#f2e5d4"}]
                }, {
                    "featureType": "poi.park",
                    "elementType": "geometry",
                    "stylers": [{"color": "#c5dac6"}]
                }, {
                    "featureType": "poi.park",
                    "elementType": "labels",
                    "stylers": [{"visibility": "on"}, {"lightness": 20}]
                }, {
                    "featureType": "road",
                    "elementType": "all",
                    "stylers": [{"lightness": 20}]
                }, {
                    "featureType": "road.highway",
                    "elementType": "geometry",
                    "stylers": [{"color": "#c5c6c6"}]
                }, {
                    "featureType": "road.arterial",
                    "elementType": "geometry",
                    "stylers": [{"color": "#e4d7c6"}]
                }, {
                    "featureType": "road.local",
                    "elementType": "geometry",
                    "stylers": [{"color": "#fbfaf7"}]
                }, {
                    "featureType": "water",
                    "elementType": "all",
                    "stylers": [{"visibility": "on"}, {"color": "#acbcc9"}]
                }]
            }).marker(function(map) {
                return {
                    position: map.getCenter(),
                    icon: 'images/marker.png',
                    animation: google.maps.Animation.BOUNCE
                };
            }).infowindow({
                content: map.data('address')
            }).then(function(infowindow) {
                var map = this.get(0);
                var marker = this.get(1);
                marker.addListener('click', function() {
                    infowindow.open(map, marker);
                });
            });
        }
        else {
            console.log("Notice: Don't have map on this page!!!");
        }
    }

    function rating() {
        $('.ps-rating').barrating({
            theme: 'fontawesome-stars'
        });
    }

    function niceSelect() {
        $('.ps-select').niceSelect();
    }

    function countDown() {
        //Call countdown plugin
        var time = $(".ps-countdown__time");
        time.each(function() {
            var el = $(this),
                value = $(this).data('time');
            var countDownDate = new Date(value).getTime();
            var timeout = setInterval(function() {
                var now = new Date().getTime(),
                    distance = countDownDate - now;
                var days = Math.floor(distance / (1000 * 60 * 60 * 24)),
                    hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)),
                    minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)),
                    seconds = Math.floor((distance % (1000 * 60)) / 1000);
                // el.find('.days').html(days);
                el.find('.hours').html(days * 24 + hours);
                el.find('.minutes').html(minutes);
                el.find('.seconds').html(seconds);
                if (distance < 0) {
                    clearInterval(timeout);
                    el.closest('.ps-section').hide();
                }
            }, 1000);
        });
    }

    function magnificPopup() {
        var quickviewMain = $('.quickview--main'),
            quickviewThumbnail = $('.quickview--thumbnail');
        $('.popup-modal').magnificPopup({
            type: 'inline',
            preloader: false,
            modal: true,
            midClick: true,
            closeBtnInside: true,
            removalDelay: 500, //delay removal by X to allow out-animation
            callbacks: {
                beforeOpen: function() {
                    this.st.mainClass = this.st.el.attr('data-effect');
                },
                open: function() {
                    owlCarousel(quickviewMain);
                    owlCarousel(quickviewThumbnail);
                    syncCarousel($('.quickview--main'), $('.quickview--thumbnail'), 1000);
                },
            }
        });
        if ($('#modal--subscribe').length > 0) {
            setTimeout(function () {
                $.magnificPopup.open({
                    items: {
                        src: '#modal--subscribe'
                    },
                    type: 'inline',
                    modal: true,
                }, 0);
            }, 10000);
        }
        $(document).on('click', '.modal-close', function(e) {
            e.preventDefault();
            $.magnificPopup.close();
        });
    }

    function filterSlider() {
        var el = $('.ac-slider');
        var min = el.siblings().find('.ac-slider__min');
        var max = el.siblings().find('.ac-slider__max');
        var defaultMinValue = el.data('default-min');
        var defaultMaxValue = el.data('default-max');
        var maxValue = el.data('max');
        var step = el.data('step');

        if (el.length > 0) {
            el.slider({
                min: 0,
                max: maxValue,
                step: step,
                range: true,
                values: [defaultMinValue, defaultMaxValue],
                slide: function(event, ui) {
                    var $this = $(this),
                        values = ui.values;

                    min.text('$' + values[0]);
                    max.text('$' + values[1]);
                }
            });

            var values = el.slider("option", "values");
            min.text('$' + values[0]);
            max.text('$' + values[1]);
        }
        else {
            return false;
        }
    }

    function searchToggle() {
        var open = $('.ps-search-btn'),
            close = $('.ps-searchbox__remove'),
            body = $('body'),
            searchbox = $('.ps-searchbox');
         open.on('click', function(e) {
            e.preventDefault();
            searchbox.addClass('active');
            body.css({
                overflow: 'hidden'
            }); 
        });
        close.on('click', function(e) {
            e.preventDefault();
            searchbox.removeClass('active');
            body.css({
                overflow: 'auto'
            });
        });
    }

    function dateTimePicker() {
        $('.date-picker').datetimepicker({format: 'DD/MM/YYYY'});
        $('.time-picker').datetimepicker({format: 'DD/MM/YYYY hh:mm'});
    }

    function backToTop() {
        var scrollPos = 0;
        var element = $('#back2top');
        $(window).scroll(function() {
            var scrollCur = $(window).scrollTop();
        /*     if (scrollCur > scrollPos) { */
                // scroll down
                if (scrollCur > 500) {
                    element.addClass('active');
                } else {
                    element.removeClass('active');
                }
     /*        } else {
                // scroll up
                element.removeClass('active');
            } */

            scrollPos = scrollCur;
        });

        element.on('click', function() {
            $('html, body').animate({
                scrollTop: '0px'
            }, 800);
        })
    }

    function slickConfig() {
        $('.slick.ps-cake-detail').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            asNavFor: '.slick.ps-cake-list',
            dots: false,
            arrows: false,

        });
        $('.slick.ps-cake-list').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: false,
            arrow: false,
            focusOnSelect: true,
            asNavFor: '.slick.ps-cake-detail',
            vertical: true,
            responsive: [
                {
                    breakpoint: 992,
                    settings: {
                        arrows: false,
                        slidesToShow: 4,
                        vertical: false
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 3,
                        vertical: false
                    }
                },
            ]
        });
    }

    function revolution() {

        var tpj = jQuery;

        var revapi1059;
        tpj(document).ready(function() {
            if (tpj("#rev_slider_1059_1").revolution == undefined) {
                revslider_showDoubleJqueryError("#rev_slider_1059_1");
            } else {
                revapi1059 = tpj("#rev_slider_1059_1").show().revolution({
                    sliderType: "standard",
                    jsFileLocation: "plugins/revolution/js/",
                    sliderLayout: "fullscreen",
                    dottedOverlay: "none",
                    delay: 5000,
                    navigation: {
                        keyboardNavigation: "on",
                        keyboard_direction: "horizontal",
                        mouseScrollNavigation: "off",
                        mouseScrollReverse: "default",
                        onHoverStop: "on",
                        arrows: {
                            enable: true,
                            style: 'gyges',
                        },
                        touch: {
                            touchenabled: "on",
                            swipe_threshold: 75,
                            swipe_min_touches: 50,
                            swipe_direction: "horizontal",
                            drag_block_vertical: false
                        }
                        ,
                    },
                    responsiveLevels: [1240, 1024, 778, 480],
                    visibilityLevels: [1240, 1024, 778, 480],
                    gridwidth: [1240, 1024, 778, 480],
                    gridheight: [868, 768, 960, 720],
                    lazyType: "none",
                    parallax: {
                        type: "scroll",
                        origo: "slidercenter",
                        speed: 1000,
                        levels: [5, 10, 15, 20, 25, 30, 35, 40, 45, 46, 47, 48, 49, 50, 100, 55],
                        type: "scroll",
                    },
                    shadow: 0,
                    spinner: "off",
                    stopLoop: "off",
                    shuffle: "off",
                    autoHeight: "off",
                    fullScreenAutoWidth: "off",
                    fullScreenAlignForce: "off",
                    fullScreenOffsetContainer: "",
                    fullScreenOffset: "60px",
                    disableProgressBar: "on",
                    hideThumbsOnMobile: "off",
                    hideSliderAtLimit: 0,
                    hideCaptionAtLimit: 0,
                    hideAllCaptionAtLilmit: 0,
                    debugMode: false,
                    fallbacks: {
                        simplifyAll: "off",
                        nextSlideOnWindowFocus: "off",
                        disableFocusListener: false,
                    }
                });
            }
        });
        /*ready*/
    }

    $(document).ready(function() {
        backgroundImage();
        parallax();
        menuBtnToggle();
        subMenuToggle();
        masonry();
        rating();
        mapConfig();
        niceSelect();
        countDown();
        revolution();
        owlCarousel($('.owl-slider'));
        syncCarousel($('.primary'), $('.second'), 1000);
        syncCarousel($('.ps-cake-detail'), $('.ps-cake-list'), 1000);
        magnificPopup();
        filterSlider();
     //   searchToggle();
        dateTimePicker();
        backToTop();
        slickConfig();
    });

    $(window).on('load', function() {
        $('.loader').addClass('active');
    });

    $(window).on('load resize', function() {
        resizeHeader();
        stickyHeader();
    });
})(jQuery);
