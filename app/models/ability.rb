class Ability
  include CanCan::Ability

  def initialize(user)
    if user.type == "Recruiter"
      can [:create_jobs, :view_all_jobs, :update, :view_job_applications,
       :approve_job_applications, :view_approved_job_applications,
       :reject_job_applications, :view_rejected_job_applications, :job_delete], Job , user_id: user.id
       can [:create, :show, :update], Recruiter
     else user.type == "Seeker"
      can [:create, :show, :update ,:search_job, :view_jobs, :apply_for_job, :view_applied_jobs], Seeker
    end

  end
end
