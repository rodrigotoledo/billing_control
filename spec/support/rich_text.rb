# frozen_string_literal: true

def fill_in_trix_editor(id, with:)
  find(:css, "##{id}").click.set(with)
end
