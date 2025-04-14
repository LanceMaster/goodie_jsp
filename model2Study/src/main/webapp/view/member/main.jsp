<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%-- /webapp/view/member/main.jsp--%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>회원관리</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
                <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
                <style>
                    .welcome-card {
                        max-width: 600px;
                        margin: 50px auto;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }
                    
                    .welcome-header {
                        background-color: #007bff;
                        color: white;
                        padding: 15px;
                        border-radius: 5px 5px 0 0;
                    }
                    
                    .menu-item {
                        padding: 15px;
                        border-bottom: 1px solid #eee;
                        transition: background-color 0.3s;
                    }
                    
                    .menu-item:hover {
                        background-color: #f8f9fa;
                    }
                    
                    .menu-item:last-child {
                        border-bottom: none;
                    }
                    
                    .menu-link {
                        color: #333;
                        text-decoration: none;
                        display: block;
                    }
                    
                    .menu-link:hover {
                        color: #007bff;
                        text-decoration: none;
                    }
                    
                    .logout-btn {
                        margin-top: 20px;
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <div class="card welcome-card">
                        <div class="welcome-header text-center">
                            <h4>${sessionScope.login}님 환영합니다!</h4>
                        </div>
                        <div class="card-body">
                            <div class="menu-item">
                                <a href="info?id=${sessionScope.login}" class="menu-link">
                                    <i class="fas fa-user"></i> 내 정보 보기
                                </a>
                            </div>
                            <div class="menu-item">
                                <a href="updateForm?id=${sessionScope.login}" class="menu-link">
                                    <i class="fas fa-edit"></i> 회원 정보 수정
                                </a>
                            </div>
                            <div class="menu-item">
                                <a href="passwordForm" class="menu-link">
                                    <i class="fas fa-key"></i> 비밀번호 변경
                                </a>
                            </div>
                            <div class="menu-item">
                                <a href="deleteForm?id=${sessionScope.login}" class="menu-link">
                                    <i class="fas fa-user-times"></i> 회원 탈퇴
                                </a>
                            </div>
                            <div class="text-center logout-btn">
                                <a href="logout" class="btn btn-outline-danger">로그아웃</a>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>