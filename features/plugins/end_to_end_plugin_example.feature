@page_manager
Feature: End to End plugin example

  @not_started @amtest @staging @production
  Scenario: End to End Example
    Given I use the following liquid
      """
      default.liquid
      {% plugin sweeps my_sweeps %}
      {% marker my_sweeps %}
       
          {% for message in my_sweeps.messages %}
              {{ message.text }}
          {% endfor %}
          
          <h1> Your prize description is  {{  my_sweeps.prize_description  }}</h1>
          <h1> Your brief prize description is  {{  my_sweeps.brief_prize_description }}</h1>
          {% if my_sweeps.has_ended %}
              {{ my_sweeps.after_content }}
          {% elsif my_sweeps.completed %}
              <h1> You just completed the Sweeps ..Congrats </h1>
          {% elsif my_sweeps.has_not_started %}
              {{ my_sweeps.before_content }}
          {% else %}
              {% formblock my_sweeps %}
                  {% for field in my_sweeps.fields %}
                      {{ field.body }}
                  {% endfor %}
                  {{ my_sweeps.policy_checkbox }}
                  {{ my_sweeps.submit_button }}
              {% endformblock %}
          {% endif %}
      {% endmarker %}
      """
    And I use the following css
      """
      global.css
      body
      {
      background-color:#d0e4fe;
      }
      h1
      {
      color:orange;
      text-align:center;
      }
      """
