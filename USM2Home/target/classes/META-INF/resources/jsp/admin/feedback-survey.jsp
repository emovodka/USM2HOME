<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>

<script>
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('success') === '1') {
            alert('Submit successfully!');
            if (window.history.replaceState) {
                const url = window.location.protocol + "//" + window.location.host + window.location.pathname;
                window.history.replaceState({path: url}, '', url);
            }
        }
    }

    function validateSurveyForm() {
        const questions = [
            "q1UiClear", "q2SearchEasy", "q3InfoTrue", "q4ContactValid", "q5PicDesc",
            "q6FoundHouse", "q7FavContact", "q8FlowSmooth", "q9Satisfaction", "q10Recommend", "q11Bug"
        ];
        for (let i = 0; i < questions.length; i++) {
            const radios = document.getElementsByName(questions[i]);
            let checked = false;
            for (let j = 0; j < radios.length; j++) {
                if (radios[j].checked) {
                    checked = true;
                    break;
                }
            }
            if (!checked) {
                alert("Please complete every question!");
                return false;
            }
        }
        return true;
    }
</script>

<style>
    .survey-card {
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        padding: 30px 40px 20px 40px;
        margin: 30px auto;
        max-width: 700px;
    }
    .survey-title {
        font-size: 2rem;
        font-weight: bold;
        margin-bottom: 25px;
        color: #337ab7;
        text-align: center;
    }
    .question {
        margin-bottom: 22px;
        padding-bottom: 12px;
        border-bottom: 1px solid #f0f0f0;
    }
    .question:last-child {
        border-bottom: none;
    }
    .stars label {
        margin-right: 12px;
        font-weight: normal;
        cursor: pointer;
    }
    .stars input[type="radio"] {
        margin-right: 3px;
    }
    textarea {
        width: 100%;
        border-radius: 4px;
        border: 1px solid #ccc;
        padding: 8px;
        resize: vertical;
    }
    .btn-submit {
        display: block;
        width: 100%;
        margin-top: 20px;
        font-size: 1.1rem;
        padding: 10px 0;
    }
    .question-label {
        font-weight: 500;
        margin-bottom: 6px;
        display: block;
    }
</style>

<div class="content-wrapper">
    <section class="content-header">
        <h1>Feedback Survey</h1>
    </section>
    <section class="content container-fluid">
        <div class="survey-card">
            <div class="survey-title">We value your feedback!</div>
            <form action="/admin/feedbackSurvey/submit" method="post" onsubmit="return validateSurveyForm();">
                <div class="question">
                    <span class="question-label">1. Is the website interface clear and easy to use?</span>
                    <span class="stars">
                        <label><input type="radio" name="q1UiClear" value="1">1</label>
                        <label><input type="radio" name="q1UiClear" value="2">2</label>
                        <label><input type="radio" name="q1UiClear" value="3">3</label>
                        <label><input type="radio" name="q1UiClear" value="4">4</label>
                        <label><input type="radio" name="q1UiClear" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">2. Are the search and filter functions easy to use?</span>
                    <span class="stars">
                        <label><input type="radio" name="q2SearchEasy" value="1">1</label>
                        <label><input type="radio" name="q2SearchEasy" value="2">2</label>
                        <label><input type="radio" name="q2SearchEasy" value="3">3</label>
                        <label><input type="radio" name="q2SearchEasy" value="4">4</label>
                        <label><input type="radio" name="q2SearchEasy" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">3. Is the property information real and accurate?</span>
                    <span class="stars">
                        <label><input type="radio" name="q3InfoTrue" value="1">1</label>
                        <label><input type="radio" name="q3InfoTrue" value="2">2</label>
                        <label><input type="radio" name="q3InfoTrue" value="3">3</label>
                        <label><input type="radio" name="q3InfoTrue" value="4">4</label>
                        <label><input type="radio" name="q3InfoTrue" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">4. Is the landlord/agent contact information valid?</span>
                    <span class="stars">
                        <label><input type="radio" name="q4ContactValid" value="1">1</label>
                        <label><input type="radio" name="q4ContactValid" value="2">2</label>
                        <label><input type="radio" name="q4ContactValid" value="3">3</label>
                        <label><input type="radio" name="q4ContactValid" value="4">4</label>
                        <label><input type="radio" name="q4ContactValid" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">5. Are the property pictures and descriptions detailed and clear?</span>
                    <span class="stars">
                        <label><input type="radio" name="q5PicDesc" value="1">1</label>
                        <label><input type="radio" name="q5PicDesc" value="2">2</label>
                        <label><input type="radio" name="q5PicDesc" value="3">3</label>
                        <label><input type="radio" name="q5PicDesc" value="4">4</label>
                        <label><input type="radio" name="q5PicDesc" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">6. Did you successfully find a property that meets your needs?</span>
                    <span class="stars">
                        <label><input type="radio" name="q6FoundHouse" value="1">1</label>
                        <label><input type="radio" name="q6FoundHouse" value="2">2</label>
                        <label><input type="radio" name="q6FoundHouse" value="3">3</label>
                        <label><input type="radio" name="q6FoundHouse" value="4">4</label>
                        <label><input type="radio" name="q6FoundHouse" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">7. Are the favorite and contact landlord functions easy to use?</span>
                    <span class="stars">
                        <label><input type="radio" name="q7FavContact" value="1">1</label>
                        <label><input type="radio" name="q7FavContact" value="2">2</label>
                        <label><input type="radio" name="q7FavContact" value="3">3</label>
                        <label><input type="radio" name="q7FavContact" value="4">4</label>
                        <label><input type="radio" name="q7FavContact" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">8. Is the overall rental process smooth?</span>
                    <span class="stars">
                        <label><input type="radio" name="q8FlowSmooth" value="1">1</label>
                        <label><input type="radio" name="q8FlowSmooth" value="2">2</label>
                        <label><input type="radio" name="q8FlowSmooth" value="3">3</label>
                        <label><input type="radio" name="q8FlowSmooth" value="4">4</label>
                        <label><input type="radio" name="q8FlowSmooth" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">9. Overall satisfaction with the experience</span>
                    <span class="stars">
                        <label><input type="radio" name="q9Satisfaction" value="1">1</label>
                        <label><input type="radio" name="q9Satisfaction" value="2">2</label>
                        <label><input type="radio" name="q9Satisfaction" value="3">3</label>
                        <label><input type="radio" name="q9Satisfaction" value="4">4</label>
                        <label><input type="radio" name="q9Satisfaction" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">10. Would you recommend this website to others?</span>
                    <span class="stars">
                        <label><input type="radio" name="q10Recommend" value="1">1</label>
                        <label><input type="radio" name="q10Recommend" value="2">2</label>
                        <label><input type="radio" name="q10Recommend" value="3">3</label>
                        <label><input type="radio" name="q10Recommend" value="4">4</label>
                        <label><input type="radio" name="q10Recommend" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">11. Did you encounter any bugs or functional issues?</span>
                    <span class="stars">
                        <label><input type="radio" name="q11Bug" value="1">1</label>
                        <label><input type="radio" name="q11Bug" value="2">2</label>
                        <label><input type="radio" name="q11Bug" value="3">3</label>
                        <label><input type="radio" name="q11Bug" value="4">4</label>
                        <label><input type="radio" name="q11Bug" value="5">5</label>
                    </span>
                </div>
                <div class="question">
                    <span class="question-label">Other suggestions or comments:</span>
                    <textarea name="suggestion" rows="3" placeholder="Your suggestions or comments..."></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-submit">Submit</button>
            </form>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
