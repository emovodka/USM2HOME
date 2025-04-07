// 1. 用户反馈
function submitFeedback() {

    $.ajax({
        type: 'POST',
        url: '/feedback/submit',
        async: false,
        data: $("#feedbackForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 未登录弹出登录弹出层
            if (data.msg == null || data.msg.indexOf('登录') != -1) {
                $('#gotoLogin').click();
                return;
            }
            // 提示信息
            alert(data.msg);
            // 如果反馈成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}

// 2.收藏房子提交
function submitMark(houseId) {
    $.ajax({
        type: 'POST',
        url: '/mark/submit',
        async: false,
        data: {
            "houseId": houseId // 以表单格式传参数
        },
        success: function (data) {
            // 未登录弹出登录弹出层
            if (data.msg == null || data.msg.indexOf('登录') != -1) {
                $('#gotoLogin').click();
                return;
            }
            // 提示信息
            alert(data.msg);

        }
    });
}

// 3.登录提交
function submitLogin() {
    $.ajax({
        type: 'POST',
        url: '/login/submit',
        async: false,
        data: $("#loginForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果登录成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


// 4.注册提交
function submitRegister() {
    $.ajax({
        type: 'POST',
        url: '/register/submit',
        async: false,
        data: $("#registerForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果注册成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


// 5.找回密码
function submitForget() {
    $.ajax({
        type: 'POST',
        url: '/forget/submit',
        async: false,
        data: $("#forgetForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果登录成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


// 5.个人信息保存
function submitProfile() {
    $.ajax({
        type: 'POST',
        url: '/admin/profile/submit',
        async: false,
        data: $("#profileForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果操作成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


// 6.密码保存
function submitPassword() {
    $.ajax({
        type: 'POST',
        url: '/admin/password/submit',
        async: false,
        data: $("#passwordForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果操作成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


// 6.上架房子
function upHouse(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/house/up',
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果操作成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}

// 7.下架房子
function downHouse(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/house/down',
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果操作成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


// 8.删除房子
function deleteHouse(id) {
    if (confirm('Are You Sure to Delete this House？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/house/delete',
            async: false,
            data: {
                "id": id
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 如果操作成功，刷新页面
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }

}


// 9.取消收藏
function cancelMark(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/mark/cancel',
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果操作成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });

}

// 10.删除反馈
function deleteFeedback(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/feedback/delete',
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果操作成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });

}

// 11.弹出反馈回复模态框
function showReplyModal(id) {
    $('#feedbackId').val(id);
}

// 12.更新反馈
function feedbackReplySubmit() {
    $.ajax({
        type: 'POST',
        url: '/admin/feedback/reply/submit',
        async: false,
        data: $("#feedbackForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果操作成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });

}

// 13.地图按钮点击弹出地图或收缩
function toggleMap() {
    $('#map').toggleClass('active');
    $('#gallery').toggleClass('active');
}

// 14.照片按钮点击弹出地图或收缩
function toggleGallery() {
    $('#map').toggleClass('active');
    $('#gallery').toggleClass('active');
}

// 15.创建订单
function createOrder() {
    let endDate = $('#endDate').val();
    let houseId = $('#houseId').val();
    $.ajax({
        type: 'POST',
        url: '/order/create',
        async: false,
        data: {
            'houseId': houseId,
            'endDate': endDate
        },
        success: function (data) {

            // 未登录弹出登录弹出层
            if (data.msg == null || data.msg.indexOf('登录') != -1) {
                $('#gotoLogin').click();
                return;
            }

            // 提示信息
            alert(data.msg);

            // 如果创建成功，跳转签订合同页面
            if (data.code == 1) {
                window.location.href = '/order/agreement/view?orderId=' + data.result;
            }
        }
    });

}


// 16.完成签订合同
function confirmAgreement(id) {
    $.ajax({
        type: 'POST',
        url: '/order/agreement/submit',
        async: false,
        data: {
            'orderId': id,
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果签订成功，跳转支付页面
            if (data.code == 1) {
                window.location.href = '/order/pay?orderId=' + data.result;
            }
        }
    });

}


// 16.支付订单
function submitOrderPay(id) {
    $.ajax({
        type: 'POST',
        url: '/order/pay/submit',
        async: false,
        data: {
            'orderId': id,
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果支付成功，跳转我的家页面
            if (data.code == 1) {
                window.location.href = '/admin/home';
            }
        }
    });

}


// 17.取消订单
function cancelOrder(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/order/cancel',
        async: false,
        data: {
            'orderId': id,
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 刷新
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });

}


// 18.提前退租申请
function endOrder(id) {
    if (confirm('你确定要提前退租，租客与房东已经沟通达成一致了？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/order/end',
            async: false,
            data: {
                'orderId': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }

}


// 19.禁用用户
function disableUser(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/user/disable',
        async: false,
        data: {
            'id': id,
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 刷新
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


// 20.启用用户
function enableUser(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/user/enable',
        async: false,
        data: {
            'id': id,
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 刷新
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}

// 21.删除新闻
function deleteNews(id) {
    if (confirm('你确定要删除这篇新闻吗？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/news/delete',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
}

// 22.保存新闻
function submitNews() {
    $.ajax({
        type: 'POST',
        url: '/admin/news/publish/submit',
        async: false,
        data: $("#newsForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果反馈成功，刷新页面
            if (data.code == 1) {
                window.location.href = "/news/detail/" + data.result;
            }
        }
    });
}

// 23.保存房子信息
function submitHouse() {
    $.ajax({
        type: 'POST',
        url: '/admin/house/publish/submit',
        async: false,
        data: $("#houseForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果发布成功，刷新页面
            if (data.code == 1) {
                window.location.href = "/admin/house";
            }
        }
    });
}


// 24.审核通过
function checkPassHouse(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/house/checkPass',
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果成功，刷新页面
            if (data.code == 1) {
                window.location.href = "/admin/house";
            }
        }
    });
}

// 24.审核拒绝
function checkRejectHouse(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/house/checkReject',
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果成功，刷新页面
            if (data.code == 1) {
                window.location.href = "/admin/house";
            }
        }
    });
}

// 25.发送邮件，联系房东
function submitContact() {
    $.ajax({
        type: 'POST',
        url: '/house/contact',
        async: false,
        data: $('#contactForm').serialize(),
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        },
        error: function (data) {
            // 提示信息
            alert('请填写完整信息');
        },
    });
}


// 26.退租申请通过
function endOrderPass(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/order/endPass',
        async: false,
        data: {
            'orderId': id,
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 刷新
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });

}


// 26.退租申请拒绝
function endOrderReject(id) {
    $.ajax({
        type: 'POST',
        url: '/admin/order/endReject',
        async: false,
        data: {
            'orderId': id,
        },
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 刷新
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });

}

// 27.删除用户
function deleteUser(id) {
    if (confirm('Are You Sure to Delete this User？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/user/delete',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
}

// 28.删除文章
function deletePost(id) {
    if (confirm('Are You Sure to Delete this News？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/post/delete',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
}


// 29.删除评论
function deleteComment(id) {
        if (confirm('Are You Sure to Delete this Comment？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/comment/delete',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
}

// 30.发布求租
function submitPost() {
    $.ajax({
        type: 'POST',
        url: '/admin/post/publish/submit',
        async: false,
        data: $("#postForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果反馈成功，刷新页面
            if (data.code == 1) {
                window.location.href = "/post/detail/" + data.result;
            }
        }
    });
}


// 31.留言提交
function submitComment() {
    $.ajax({
        type: 'POST',
        url: '/admin/comment/publish/submit',
        async: false,
        data: $("#commentForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果反馈成功，刷新页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}

// 32.上传照片

$('body').on('change', '#file', function () {
    var formData = new FormData();
    var files = $($(this))[0].files[0];
    formData.append("file", files);
    $.ajax({
        url: '/file/upload/simple',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function (res) {
            console.log(res);
            $('#imgUrl').attr('src', res.result);
            $('#idCardImg').val(res.result);
            // alert('上传成功');
        }
        , error: function (res) {
            // alert('错误');
        }
    });
})


// 33.发布报修
function submitMaintain() {
    $.ajax({
        type: 'POST',
        url: '/admin/maintain/publish/submit',
        async: false,
        data: $("#form").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果发布成功，刷新页面
            if (data.code == 1) {
                window.location.href = "/admin/maintain/detail/" + data.result;
            }
        }
    });
}


// 34.删除报修
function deleteMaintain(id) {
        if (confirm('Are You Sure to Delete this Maintain？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/maintain/delete',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
}


// 35.删除报修
function finishMaintain(id) {
    if (confirm('Are You Sure to Finish the Maintenance？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/maintain/finish',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
}

// 36.账单支付
function billPay(id) {
        $.ajax({
            type: 'POST',
            url: '/admin/bill/pay',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.href = "/admin/bill";
                }
            }
        });
}


// 37.创建账单
function submitBill() {
    $.ajax({
        type: 'POST',
        url: '/admin/bill/publish/submit',
        async: false,
        data: $("#form").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果发布成功，刷新页面
            if (data.code == 1) {
                window.location.href = '/admin/order';
            }
        }
    });
}

// 38.删除账单
function deleteBill(id) {
        if (confirm('Are You Sure to Delete this Bill？')) {
        $.ajax({
            type: 'POST',
            url: '/admin/bill/delete',
            async: false,
            data: {
                'id': id,
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 刷新
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
}

// 39.发布反馈
function submitFeedback() {
    $.ajax({
        type: 'POST',
        url: '/admin/feedback/publish/submit',
        async: false,
        data: $("#postForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
            // 提示信息
            alert(data.msg);
            // 如果反馈成功，刷新页面
            if (data.code == 1) {
                window.location.href = "/admin/feedback";
            }
        }
    });
}



